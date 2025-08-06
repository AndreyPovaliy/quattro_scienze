from array import *

print("mkdir ./workspace")
print("mkdir ./workspace/disser")
print("mkdir ./workspace/disser/str")
print("touch ./workspace/disser/str/main_disser.R")
print("mkdir ./workspace/disser/str/deconst")

print("\n")

print('echo \"FileName <- \\"./workspace/disser/str/text_disser.txt\\"\">> ./workspace/disser/str/main_disser.R')
print(f'echo \"source(\\"./create/func/run_funcs.R\\")\n\n\" >> ./workspace/disser/str/main_disser.R')
print("\n")

filename = "./create/disser/plan.txt"
topics = []

file =  open(filename, "r").read().split('\n')

for line in file:
  topics.append(line)


for topic in topics:
  print(f'echo "# {topic} ------------------------------------------------------------" >> ./workspace/disser/str/main_disser.R')
  print(f'echo \"source(\\"./workspace/disser/str/deconst/{topic}/{topic}.R\\")\n\n\" >> ./workspace/disser/str/main_disser.R')
  print(f'mkdir ./workspace/disser/str/deconst/{topic}')
  print(f'touch ./workspace/disser/str/deconst/{topic}/plan_{topic}.txt')
  print(f'touch ./workspace/disser/str/deconst/{topic}/{topic}.R')
  print("\n")




