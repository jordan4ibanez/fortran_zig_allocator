# Make seems to break up the environmental paths so I had to put it
# into this build script.
default:
	@./build_it.sh

clean:
	@./scripts/clear_mod_files.sh
