#Resistant vs Sensitive strain of Salmon lice

#Bioproject Accession: PRJEB41730

#Download the reference genome:

wget ftp://ftp.ensemblgenomes.org/pub/metazoa/release-51/fasta/lepeophtheirus_salmonis/dna/Lepeophtheirus_salmonis.LSalAtl2s.dna.toplevel.fa.gz

#Download the reference transcriptome:

wget ftp://ftp.ensemblgenomes.org/pub/metazoa/release-51/gff3/lepeophtheirus_salmonis/Lepeophtheirus_salmonis.LSalAtl2s.51.gff3.gz.sorted.gz


#Build index

hisat2-build -p 10 -f Lepeophtheirus_salmonis.LSalAtl2s.dna.toplevel.fa salmonlice_ind


#Abstract
#Total RNA was isolated from 16 adult male salmon lice of the drug susceptible strain IoA-00 and the multi-resistant strain IoA-02, using the Trizol protocol #described in 2.7. Total isolated RNA was quantified by using Qubit 2.0 Fluorometer and Qubit RNA BR Assay Kit (Invitrogen, Thermo Fisher Scientific, UK). Quality #of isolated total RNA was determined by UV spectrophotometry using a ND-1000 NanoDrop® (Thermo Scientific, UK) and Agilent Bioanalyzer system (Agilent #Technologies, CA, USA). RNA integrity was assessed by electrophoresis using 100 ng of denaturized total RNA in a 1% agarose gel stained with ethidium bromide. #Total mRNA of each individual was sequenced on an Illumina Novaseq 6000 platform at Novogene (Cambridge, United Kingdom).

#There were total 16 samples, we selected 8 to save space.

#Download the fastq files from ENA server

wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR496/ERR4968408/A8_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR496/ERR4968408/A8_2.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR496/ERR4968416/A9_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR496/ERR4968416/A9_2.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4921801/A10_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4921801/A10_2.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4921842/A11_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4921842/A11_2.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4922109/A12_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4922109/A12_2.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4922149/A13_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4922149/A13_2.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4922191/A14_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4922191/A14_2.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4922192/A15_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR492/ERR4922192/A15_2.fastq.gz



#Now use these files to make an alignment using HISAT2

#Use these code in a text file name ls_align_sam.txt 

hisat2 -p 24 --dta -x salmonlice_ind -1 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A8_1.fastq.gz -2 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A8_2.fastq.gz -S A8_sensitive.sam 2>summary8.txt

hisat2 -p 24 --dta -x salmonlice_ind -1 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A9_1.fastq.gz -2 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A9_2.fastq.gz -S A9_sensitive.sam 2>summary9.txt

hisat2 -p 24 --dta -x salmonlice_ind -1 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A10_1.fastq.gz -2 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A10_2.fastq.gz -S A10_sensitive.sam 2>summary10.txt
hisat2 -p 24 --dta -x salmonlice_ind -1 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A11_1.fastq.gz -2 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A11_2.fastq.gz -S A11_sensitive.sam 2>summary11.txt

hisat2 -p 24 --dta -x salmonlice_ind -1 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A12_1.fastq.gz -2 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A12_2.fastq.gz -S A12_resistant.sam 2>summary12.txt

hisat2 -p 24 --dta -x salmonlice_ind -1 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A13_1.fastq.gz -2 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A13_2.fastq.gz -S A13_resistant.sam 2>summary13.txt

hisat2 -p 24 --dta -x salmonlice_ind -1 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A14_1.fastq.gz -2 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A14_2.fastq.gz -S A14_resistant.sam 2>summary14.txt

hisat2 -p 24 --dta -x salmonlice_ind -1 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A15_1.fastq.gz -2 /local/work/biocore/mol8008/mol8008_11/salmonlice/fastq_sra/A15_2.fastq.gz -S A15_resistant.sam 2>summary15.txt

#make the txt file executable by 

chmod 755 ls_align_sam.txt


#Run the alignment 

./ls_align_sam.txt



###I am here 
#Convert sam file to bam file

samtools view -bS A8_sensitive.sam > A8_sensitive.bam
samtools view -bS A9_sensitive.sam > A9_sensitive.bam
samtools view -bS A10_sensitive.sam > A10_sensitive.bam
samtools view -bS A11_sensitive.sam > A11_sensitive.bam

samtools view -bS A12_resistant.sam > A12_resistant.bam
samtools view -bS A13_resistant.sam > A13_resistant.bam
samtools view -bS A14_resistant.sam > A14_resistant.bam
samtools view -bS A15_resistant.sam > A15_resistant.bam

##sort bam file and output 

samtools sort A8_sensitive.bam -o A8_sensitive_sorted.bam
samtools sort A9_sensitive.bam -o A9_sensitive_sorted.bam
samtools sort A10_sensitive.bam -o A10_sensitive_sorted.bam
samtools sort A11_sensitive.bam -o A11_sensitive_sorted.bam

samtools sort A12_resistant.bam -o A12_resistant_sorted.bam
samtools sort A13_resistant.bam -o A13_resistant_sorted.bam
samtools sort A14_resistant.bam -o A14_resistant_sorted.bam
samtools sort A15_resistant.bam -o A15_resistant_sorted.bam

#feature count

featureCounts -T 24 -t exon -F GFF3 -g Parent -O -a Lepeophtheirus_salmonis.LSalAtl2s.51.gff3.gz.sorted.gz -o count-table.txt A8_sensitive_sorted.bam A9_sensitive_sorted.bam A10_sensitive_sorted.bam A11_sensitive_sorted.bam A12_resistant_sorted.bam A13_resistant_sorted.bam A14_resistant_sorted.bam A15_resistant_sorted.bam

#format feature count table
cp /local/work/biocore/mol8008/RNA/fcnts2dseq.py .
python fcnts2dseq.py count-table.txt

#find differential expression using voom script
cp /local/work/biocore/mol8008/RNA/Voom_script.r .

#using Voom limma 
Rscript --vanilla Voom_script.r

#using EdgeR-GLM method
Rscript --vanilla EdgeR_GLM-salmonlice.r








