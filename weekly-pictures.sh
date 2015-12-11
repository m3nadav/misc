DIRECTORY='./images/$(date -u +%m-%y)'

if [ ! -d "$DIRECTORY" ]; then
  mkdir -p $DIRECTORY
fi

while [[ $# > 0 ]]
do
  pushd $DIRECTORY
  curl -O $1
  if [[ $0 == 0 ]]; then
    print "url: $1 has downloaded successfuly"
  fi
  popd $DIRECTRY
shift
done


