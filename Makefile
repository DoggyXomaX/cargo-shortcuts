all:
	./install.sh

readme:
	vim README_BASE.md
	cat README_BASE.md > README.md
	cat .cargo-shortcuts | cut -c 7- >> README.md
	echo '```' >> README.md
