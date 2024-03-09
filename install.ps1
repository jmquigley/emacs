#
# Copies the .emacs.d directory into the windows appdata roaming
# directory to use emacas under windows
#

$src = (Get-Item -Path ".\" -Verbose).FullName + "\.emacs.d"
$dst = "$env:APPDATA\.emacs.d"

if (test-path $dst) {
    Remove-Item -Force -Recurse $dst
}

Copy-Item -Recurse -Force -Destination $dst $src