DIRECTORY="./images/$(date -u +%h-%y)"

if [ ! -d "$DIRECTORY" ]; then
  mkdir -p $DIRECTORY
fi

while [[ $# > 0 ]]
do
  pushd $DIRECTORY
  curl -o $(basename $1 | cut -d'?' -f1) $1
  if [[ $0 == 0 ]]; then
    print "url: $1 has downloaded successfuly"
  fi
  popd $DIRECTRY
shift
done


