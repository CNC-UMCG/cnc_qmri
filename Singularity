Bootstrap: shub
From: CNC-UMCG/cnc_spm-fsl

%environment


%post
    #############################
    # bind MATLAB folder on HPC
    #############################
    mkdir /software/software/MATLAB/2017b-GCC-4.9.3-2.25/

    #############################
    # install ANTs
    #############################
    apt-get install -y ants

    #############################
    # download vistasoft
    #############################
    git clone https://github.com/vistalab/vistasoft.git

    #############################
    # download spm8
    #############################
    wget http://www.fil.ion.ucl.ac.uk/spm/download/restricted/idyll/spm8.zip
    unzip spm8.zip
    
    # (in case upgrading to spm12
    #    wget http://www.fil.ion.ucl.ac.uk/spm/download/restricted/eldorado/spm12.zip
    #    unzip spm12.zip)
    
    #############################
    # mrQ package
    #############################
    
    git clone https://github.com/mezera/mrQ.git



