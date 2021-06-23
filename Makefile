default:
	uname -a | grep -q Darwin
	git clone --depth 1 --branch 3.3.15 https://github.com/videolan/vlckit/
	cp -v 0099-remove-UITapGestureRecognizer-from-VLCOpenGLES2Video.patch vlckit/Resources/MobileVLCKit/patches/
	cd vlckit && ./buildMobileVLCKit.sh -vft 2>&1 | tee ../build.log
	cp -v ./vlckit/build/TVVLCKit.framework ./TVVLCKit.framework

clean:
	rm -fr vlckit
	rm -f build.log
	rm -f TVVLCKit.framework
