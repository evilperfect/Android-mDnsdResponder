LOCAL_PATH := $(call my-dir)

##############  mdnsd  #################

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  mDNSPosix/PosixDaemon.c    \
                    mDNSPosix/mDNSPosix.c      \
                    mDNSPosix/mDNSUNP.c        \
                    mDNSCore/mDNS.c            \
                    mDNSCore/DNSDigest.c       \
                    mDNSCore/uDNS.c            \
                    mDNSCore/DNSCommon.c       \
                    mDNSShared/uds_daemon.c    \
                    mDNSShared/mDNSDebug.c     \
                    mDNSShared/dnssd_ipc.c     \
                    mDNSShared/GenLinkedList.c \
                    mDNSShared/PlatformCommon.c \
                    mDNSCore/anonymous.c        \
                    mDNSCore/CryptoAlg.c     


LOCAL_MODULE := mdnsd
LOCAL_MODULE_TAGS := optional

LOCAL_C_INCLUDES := external/mdnsresponder/mDNSPosix \
                    external/mdnsresponder/mDNSCore  \
                    external/mdnsresponder/mDNSShared

LOCAL_CFLAGS := -O2 -g -W -Wall 
LOCAL_CFLAGS += -D__ANDROID__  
LOCAL_CFLAGS += -D_GNU_SOURCE 
LOCAL_CFLAGS += -DHAVE_IPV6 
LOCAL_CFLAGS += -DNOT_HAVE_SA_LEN 
LOCAL_CFLAGS += -DUSES_NETLINK 
LOCAL_CFLAGS += -DTARGET_OS_LINUX 
LOCAL_CFLAGS += -fno-strict-aliasing 
LOCAL_CFLAGS += -DHAVE_LINUX 
LOCAL_CFLAGS += -DMDNS_DEBUGMSGS=0 
LOCAL_CFLAGS += -DMDNS_UDS_SERVERPATH=\"/dev/socket/mdnsd\" 
LOCAL_CFLAGS += -DMDNS_USERNAME=\"mdnsr\" 
LOCAL_CFLAGS += -DPLATFORM_NO_RLIMIT 


LOCAL_SYSTEM_SHARED_LIBRARIES := libc libcutils

include $(BUILD_EXECUTABLE)

#############  libmdnssd  #############

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  mDNSShared/dnssd_clientlib.c  \
                    mDNSShared/dnssd_clientstub.c \
                    mDNSShared/dnssd_ipc.c

LOCAL_MODULE := libmdnssd
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -O2 -g -W -Wall 
LOCAL_CFLAGS += -D__ANDROID__ 
LOCAL_CFLAGS += -D_GNU_SOURCE 
LOCAL_CFLAGS += -DHAVE_IPV6 
LOCAL_CFLAGS += -DNOT_HAVE_SA_LEN 
LOCAL_CFLAGS += -DUSES_NETLINK 
LOCAL_CFLAGS += -DTARGET_OS_LINUX 
LOCAL_CFLAGS += -fno-strict-aliasing 
LOCAL_CFLAGS += -DHAVE_LINUX 
LOCAL_CFLAGS += -DMDNS_UDS_SERVERPATH=\"/dev/socket/mdnsd\" 
LOCAL_CFLAGS += -DMDNS_DEBUGMSGS=0


LOCAL_SYSTEM_SHARED_LIBRARIES := libc libcutils

include $(BUILD_SHARED_LIBRARY)

############    dnssd     ################

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  Clients/dns-sd.c \
                    Clients/ClientCommon.c

LOCAL_MODULE := dnssd
LOCAL_MODULE_TAGS := optional

LOCAL_C_INCLUDES := external/mdnsresponder/mDNSShared

LOCAL_CFLAGS := -O2 -g -W -Wall 
LOCAL_CFLAGS += -D__ANDROID__ 
LOCAL_CFLAGS += -D_GNU_SOURCE 
LOCAL_CFLAGS += -DHAVE_IPV6 
LOCAL_CFLAGS += -DNOT_HAVE_SA_LEN 
LOCAL_CFLAGS += -DUSES_NETLINK 
LOCAL_CFLAGS += -DTARGET_OS_LINUX 
LOCAL_CFLAGS += -fno-strict-aliasing 
LOCAL_CFLAGS += -DHAVE_LINUX 
LOCAL_CFLAGS += -DMDNS_UDS_SERVERPATH=\"/dev/socket/mdnsd\" 
LOCAL_CFLAGS += -DMDNS_DEBUGMSGS=0



LOCAL_SYSTEM_SHARED_LIBRARIES := libmdnssd libc libcutils

include $(BUILD_EXECUTABLE)
