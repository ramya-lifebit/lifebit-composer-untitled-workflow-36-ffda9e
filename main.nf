nextflow.enable.dsl=2

include { 111fastqc_test_111 } from './modules/111fastqc_test_111/module.nf'
include { download_reads_1 } from './modules/download_reads_1/module.nf'

workflow {
input1 = Channel.fromPath(params.111fastqc_test_111.fastq)
input2 = Channel.fromPath(params.download_reads_1.accessions).splitCsv()
111fastqc_test_111(input1)
download_reads_1(input2)
}
