import MapReduce
import sys

"""
Word Count Example in the Simple Python MapReduce Framework
"""

mr = MapReduce.MapReduce()

# =============================
# Do not modify above this line

maxx = 0;
maxy = 0;

def mapper(record):
  global maxx, maxy
  # this assumes both matrixs have the same dimensions.
  index = 0
  #print record
  while index < 5:
    if record[0] == "a":
      mr.emit_intermediate(str(record[1])+str(index), record)
    else:
      mr.emit_intermediate(str(index)+str(record[2]), record)
    index += 1

def reducer(key, list_of_values):
  arrayA = [0 for x in xrange(5)]
  arrayB = [0 for x in xrange(5)]
  posx = int(key[0])
  posy = int(key[1])
  # recreate matrix
  for item in list_of_values:
    if item[0] == "a":
      arrayA[item[2]] = item[3]
    else:
      arrayB[item[1]] = item[3]
  index = 0  
  product = 0
#  print key,list_of_values
#  print "a",arrayA
#  print "b",arrayB
  while index < 5:
    product += arrayA[index] * arrayB[index]
    index += 1
  
#  print "product",product
  mr.emit((posx, posy, product))
#  mr.emit((row, column, product))

#  print resultsM
# Do not modify below this line
# =============================
if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  mr.execute(inputdata, mapper, reducer)
