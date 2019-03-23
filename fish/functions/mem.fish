function mem
    free -h | awk '$1 ~/^Mem:/ {print "Mem: "$3"/"$2}'
end
