from array import *

print("mkdir ./workspace")
print("mkdir ./workspace/protocol")
print("mkdir ./workspace/protocol/str")
print("touch ./workspace/protocol/str/main_protocol.R")
print("mkdir ./workspace/protocol/str/deconst")
print("mkdir ./workspace/protocol/str/deconst/text_protocol")
print("\n")

print('echo \"FileName <- \\"./str/text_protocol.txt\\"\">> ./workspace/protocol/str/main_protocol.R')
print("\n")

filename = "./create/protocol/plan.txt"
topics = []

file =  open(filename, "r").read().split('\n')

for line in file:
  topics.append(line)


for topic in topics:
  print(f'echo "# {topic} ------------------------------------------------------------" >> ./workspace/protocol/str/main_protocol.R')
  print(f'echo \"source(\\"./workspace/protocol/str/deconst/{topic}.R\\")\n\n\" >> ./workspace/protocol/str/main_protocol.R')
  print(f'touch ./workspace/protocol/str/deconst/{topic}.R')
  print(f'echo "escribir_rT(\\"./workspace/protocol/str/deconst/text_protocol/{topic}.txt\\")\" >> ./workspace/protocol/str/deconst/{topic}.R')
  print(f'touch ./workspace/protocol/str/deconst/text_protocol/{topic}.txt')
  print(f'echo \"# {topic}" >> ./workspace/protocol/str/deconst/text_protocol/{topic}.txt')
  print("\n")



