from array import *

filename = "./create/disser/plan.txt"
topics = []

file =  open(filename, "r").read().split('\n')

for line in file:
  topics.append(line)


for topic in topics:
  print(f'echo \"FileName <- \\"./str/text_disser.txt\\"\">> ./workspace/disser/str/deconst/{topic}/{topic}.R')
  print("\n")
  filename1 = f"./workspace/disser/str/deconst/{topic}/plan_{topic}.txt"
  topics1 = []
  file1 =  open(filename1, "r").read().split('\n')
  print(f"mkdir ./workspace/disser/str/deconst/{topic}/")
  print(f"mkdir ./workspace/disser/str/deconst/{topic}/deconst/")
  print(f"mkdir ./workspace/disser/str/deconst/{topic}/deconst/text")
  
  for line1 in file1:
    topics1.append(line1)
    
  for topic1 in topics1:
    print(f'echo "# {topic1} ------------------------------------------------------------" >> ./workspace/disser/str/deconst/{topic}/{topic}.R')
    print(f'echo \"source(\\"./workspace/disser/str/deconst/{topic}/deconst/{topic1}.R\\")\n\n\" >> ./workspace/disser/str/deconst/{topic}/{topic}.R')
    print(f'touch ./workspace/disser/str/deconst/{topic}/deconst/{topic1}.R')
    print(f'echo "escribir_rT(\\"./workspace/disser/str/deconst/{topic}/deconst/text/{topic1}.txt\\")\" >> ./workspace/disser/str/deconst/{topic}/deconst/{topic1}.R')
    print(f'touch ./workspace/disser/str/deconst/{topic}/deconst/text/{topic1}.txt')
    print(f'echo \"# {topic1}" >> ./workspace/disser/str/deconst/{topic}/deconst/text/{topic1}.txt')
    print("\n")


