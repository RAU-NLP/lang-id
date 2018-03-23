cd "$(dirname "$0")"

if [ ! -f train.ft.txt ]; then
  sh label.sh train.en.txt en > train.ft.txt
  sh label.sh train.es.txt es >> train.ft.txt
fi

if [ ! -f test.ft.txt ]; then
  sh label.sh test.en.txt en > test.ft.txt
  sh label.sh test.es.txt es >> test.ft.txt
fi
