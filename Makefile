SDK=$(shell xcrun --sdk iphoneos --show-sdk-path)

CC=clang

OUTPUT=UniversalPerformance.dylib

SOURCES=$(wildcard Sources/*.m)

all:
	$(CC) \
	-isysroot $(SDK) \
	-arch arm64 \
	-fobjc-arc \
	-fobjc-runtime=ios \
	-dynamiclib \
	-framework UIKit \
	-framework Foundation \
	-framework QuartzCore \
	-framework CoreGraphics \
	$(SOURCES) \
	-I Sources/include \
	-o $(OUTPUT)

clean:
	rm -f $(OUTPUT)
