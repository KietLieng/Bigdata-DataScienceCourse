import MapReduce
import sys

"""
Word Count Example in the Simple Python MapReduce Framework
"""

mr = MapReduce.MapReduce()

# =============================
# Do not modify above this line

def mapper(record):
    mr.emit_intermediate(record[0]+","+record[1], (record[0],record[1]))
    mr.emit_intermediate(record[1]+","+record[0], (record[1],record[0]))    

def reducer(key, list_of_values):
  uniqueFriends = list_of_values
#  print " values ",uniqueFriends
#  print "key ", key, " ", len(list_of_values)
  if len(uniqueFriends) < 2:	  
    for value in uniqueFriends:
      mr.emit((value[0], value[1]))
      
#	print key," length",len(value)," list length",len(list_of_values),"value",value


# Do not modify below this line
# =============================
if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  mr.execute(inputdata, mapper, reducer)
