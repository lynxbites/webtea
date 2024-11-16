# run templ generation in watch mode to detect all .templ files and 
# re-create _templ.txt files on change, then send reload event to browser. 
# Default url: http://localhost:7331
init:
	npx tailwindcss init
	go install github.com/air-verse/air@latest
	go install github.com/a-h/templ/cmd/templ@latest
	go mod tidy
#
templ:
	templ generate --watch --proxy="http://localhost:8001" --open-browser=false -v

# run air to detect any go file changes to re-build and re-run the server.
air:
	air \
	--build.cmd "go build -o tmp/bin/main" --build.bin "tmp/bin/main" --build.delay "400" \
	--build.stop_on_error "false" \
	--misc.clean_on_exit true

# run tailwindcss to generate the styles.css bundle in watch mode.
tail:
	npx tailwindcss -i "./static/css/input.css" -o "./static/css/style.css" --minify --watch 
	

# start all 5 watch processes in parallel.
live: 
	make -j2 templ air