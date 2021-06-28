FROM saschpe/android-ndk:jdk11_api30_30.0.3_ndk22.1.7171670_cmake3.18.1

ARG NDK_VERSION=22.1.7171670
ARG CMAKE_VERSION=3.18.1
ENV ANDROID_NDK_HOME=$ANDROID_SDK_ROOT/ndk/$NDK_VERSION
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmake/$CMAKE_VERSION/bin

RUN apt install --no-install-recommends -y \
	libssl-dev \
	zlib1g-dev \
	gperf \
	build-essential

VOLUME [ "/app" ]
WORKDIR /app
