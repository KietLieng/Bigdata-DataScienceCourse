import MapReduce
import sys

"""
Word Count Example in the Simple Python MapReduce Framework
"""

mr = MapReduce.MapReduce()

# =============================
# Do not modify above this line

def mapper(record):
    # key: document identifier
    # value: document contents
    key = record[0]
    mr.emit_intermediate(key, record)

orderList = []

def reducer(key, list_of_values):
#  newList = list(set(list_of_values))
  global orderList
  found = 0;
  for item in list_of_values:
    # if a line item save
    if item[0] == "line_item":
#      print "line item",item[1]
      orderList.append(item)
    else: # is a order 
      found = 1
#      print orderList
      for line in orderList:
        if int(line[1]) == int(item[1]):
          newList = []
          for eachItem in item:
            newList.append(eachItem)
          for eachLine in line:
            newList.append(eachLine)
#          newList.append(item)
          mr.emit(newList)


#  if found == 1:
#    for line in newList:
#      print str(line).encode("utf-8")
#    mr.emit(newList)

# Do not modify below this line
# =============================
if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  mr.execute(inputdata, mapper, reducer)

