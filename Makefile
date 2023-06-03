all:
	./install.sh

readme:
	cat README_BASE.md > README.md
	cat .cargo-shortcuts >> README.md
	echo '```' >> README.md
