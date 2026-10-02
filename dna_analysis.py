dna_sequence= "ATGCGTATCGGATCGATTACG"
length= len(dna_sequence)
nucleotide_count =  {"A": 0, "T": 0, "G": 0, "C": 0} 
valid_bases=["A","C","G","T"]

for i in dna_sequence:
    if i in valid_bases:
        nucleotide_count[i]= nucleotide_count[i]+1 
    else:
        print("Invalid base found:", i)
nucleotide_count={'A': 5, 'T': 6, 'G': 6, 'C': 4}
nucleotide=["A","C","G","T"]
x=0
while x<4:
    base=nucleotide[x]
    count=nucleotide_count[base]
    print (base,"=",count)

    x=x+1

def calculate_gc_content(sequence):

    g_count = sequence.count("G")
    c_count = sequence.count("C")

    gc_content = ((g_count + c_count) / len(sequence)) * 100

    print (gc_content,"%")
