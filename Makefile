all:
	./install.sh

readme:
	vim README_BASE.md
	cat README_BASE.md > README.md
	cat .cargo-shortcuts >> README.md
	echo '```' >> README.md
