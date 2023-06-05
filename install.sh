#!/bin/bash

function getAbsolutePath() {
	local path=$(cd -- $1 && pwd)
	echo $path
}

function getScriptPath() {
	local rawPath="$(dirname -- "${BASH_SOURCE[0]}")"
	local path=$(getAbsolutePath $rawPath)
	echo $path
}

function getEnv() {
  if [[ $1 ]]; then
		echo $1
	else
		echo $2
	fi
}

scriptPath=$(getScriptPath)
filename=".cargo-shortcuts"

sourceFile="${scriptPath}/${filename}"
targetPath=$(getAbsolutePath $(getEnv $TARGET_PATH ~))
targetFile="${targetPath}/${filename}"

if [ ! -f "${targetFile}" ]; then
	echo "==== ${targetFile} not found, creating RC entry... ===="

	shell=$(getEnv "${SHELL}" "/bin/bash")
	if [ "${shell}" == "/usr/bin/zsh"  ] || [ "${shell}" == "/bin/zsh" ]; then
		echo "Adding source entry to ~/.zshrc"
		echo "source ${targetFile}" >> ~/.zshrc
	elif [ "${shell}" == "/usr/bin/bash" ] || [ "${shell}" == "/bin/bash" ]; then
		echo "Adding source entry to ~/.bashrc"
		echo "source ${targetFile}" >> ~/.bashrc
	else
		echo "Unknown shell ${shell}"
	fi

	echo "==== Creating shortcuts ===="
else
	echo "==== Updating shortcuts ===="
fi

echo "Copying ${sourceFile} to ${targetFile}"
cp $sourceFile $targetFile

echo "Done. Changes will appear after relogin or source ~/.*rc"
