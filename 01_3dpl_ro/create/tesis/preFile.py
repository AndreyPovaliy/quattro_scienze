from array import *

print("mkdir ./workspace/tesis")
print("mkdir ./workspace/tesis/str")
print("touch ./workspace/tesis/str/main_tesis.R")
print("mkdir ./workspace/tesis/str/deconst")
print("mkdir ./workspace/tesis/str/deconst/text_tesis")
print("\n")

print('echo \"FileName <- \\"./str/text_tesis.txt\\"\">> ./workspace/tesis/str/main_tesis.R')
print("\n")

filename = "./create/tesis/plan.txt"
topics = []

file =  open(filename, "r").read().split('\n')

for line in file:
  topics.append(line)


for topic in topics:
  print(f'echo "# {topic} ------------------------------------------------------------" >> ./workspace/tesis/str/main_tesis.R')
  print(f'echo \"source(\\"./workspace/tesis/str/deconst/{topic}.R\\")\n\n\" >> ./workspace/tesis/str/main_tesis.R')
  print(f'touch ./workspace/tesis/str/deconst/{topic}.R')
  print(f'echo "escribir_rT(\\"./workspace/tesis/str/deconst/text_tesis/{topic}.txt\\")\" >> ./workspace/tesis/str/deconst/{topic}.R')
  print(f'touch ./workspace/tesis/str/deconst/text_tesis/{topic}.txt')
  print(f'echo \"# {topic}" >> ./workspace/tesis/str/deconst/text_tesis/{topic}.txt')
  print("\n")



