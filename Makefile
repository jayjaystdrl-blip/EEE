SDK=$(shell xcrun --sdk iphoneos --show-sdk-path)

CC=clang

ARCHS=arm64

OUTPUT=UniversalPerformance.dylib

SOURCES=$(wildcard Sources/*.m)

all:
	$(CC) \
	-isysroot $(SDK) \
	-arch arm64 \
	-fobjc-arc \
	-dynamiclib \
	-framework UIKit \
	-framework Foundation \
	$(SOURCES) \
	-I Sources/include \
	-o $(OUTPUT)

clean:
	rm -f $(OUTPUT)
