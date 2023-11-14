
build:
	@mush build

test-nuv: build
	@mush run -- --ignore R011,R012 nuv

test-mush:
	@mush run mush
