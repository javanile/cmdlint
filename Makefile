
build:
	@mush build

test-nuv: build
	@mush run -- --ignore R011 nuv

test-mush:
	@mush run mush
