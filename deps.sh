sudo apt-get update
sudo apt-get install sbcl
sudo apt-get install emacs
sudo apt-get install slime
sudo apt-get install libjpeg-progs
sudo apt-get install  gif2png

curl -O https://beta.quicklisp.org/quicklisp.lisp
curl -O https://beta.quicklisp.org/quicklisp.lisp.asc
gpg --verify quicklisp.lisp.asc quicklisp.lisp
sbcl --load quicklisp.lisp

cd ~/quicklisp/local-projects
git clone https://github.com/vtomole/closure.git
git clone https://github.com/robert-strandh/McCLIM.git
git clone git://repo.or.cz/cxml.git
git clone git://repo.or.cz/closure-common.git
git clone https://github.com/sionescu/bordeaux-threads.git
git clone https://github.com/bluelisp/zip.git
git clone git://repo.or.cz/closure-html.git
git clone https://github.com/edicl/flexi-streams.git

