Bootstrap: shub
From: CNC-UMCG/cnc_base

%environment

    #############################
    # Software Paths
    #############################

    MATLAB_VERSION=R2017b
    MCR_VERSION=v93
    LD_LIBRARY_PATH=/opt/mcr/${MCR_VERSION}/runtime/glnxa64:/opt/mcr/${MCR_VERSION}/bin/glnxa64:/opt/mcr/${MCR_VERSION}/sys/os/glnxa64:/opt/mcr/${MCR_VERSION}/sys/opengl/lib/glnxa64
    MCR_INHIBIT_CTF_LOCK=1
    SPM_VERSION=12
    SPM_REVISION=r7244
    SPM_DIR=/opt/spm${SPM_VERSION}
    SPM_EXEC=${SPM_DIR}/spm${SPM_VERSION}
    export MATLAB_VERSION MCR_VERSION LD_LIBRARY_PATH MCR_INHIBIT_CTF_LOCK
    export SPM_DIR SPM_EXEC SPM_VERSION SPM_REVISION



%post

# Set build specific variables
export BUILD_SOFTWARE="git cmake lib32z1-dev g++"
export CONTAINER_SOFTWARE=""
export ANTS_VERSION="v2.2.0"
# Set paths to facilitate the build process.
export BUILDHOME="/opt"
export CLONE_DIR=/opt
export ANTS_GIT_REPOSITORY=${CLONE_DIR}/ANTs
export ANTS_GIT_REMOTE="https://github.com/stnava/ANTs.git"
export ANTS_HOME=${BUILDHOME}/ants

# Install build requirements.
apt-get update -y
apt-get install $BUILD_SOFTWARE $CONTAINER_SOFTWARE -y 

# Get ANTs from GitHub.
cd $CLONE_DIR
git clone $ANTS_GIT_REMOTE

# Select desired version.
cd $ANTS_GIT_REPOSITORY
git checkout $ANTS_VERSION

# Build ANTs in $ANTS directory
mkdir -p $ANTS_HOME
cd $ANTS_HOME
# Move copyright notice into ANTs Home
cp ${ANTS_GIT_REPOSITORY}/ANTSCopyright.txt ${ANTS_HOME}/
cmake ${ANTS_GIT_REPOSITORY}
make

# Move scripts into the ANTs path.
mv ${ANTS_GIT_REPOSITORY}/Scripts/* $ANTS_HOME/bin/

# Set the path environment variables for ANTs.

echo "export ANTSPATH=${ANTS_HOME}/bin" >> $SINGULARITY_ENVIRONMENT
echo 'export PATH=${ANTSPATH}:$PATH' >> $SINGULARITY_ENVIRONMENT

    apt-get -qq update && apt-get -qq install -y \
        unzip \
        xorg \
        wget

    #############################
    # Matlab Environment
    #############################

    MATLAB_VERSION=R2017b
    export MATLAB_VERSION
    mkdir -p /opt/mcr_install && \
    mkdir -p /opt/mcr && \
    wget -P /opt/mcr_install http://www.mathworks.com/supportfiles/downloads/${MATLAB_VERSION}/deployment_files/${MATLAB_VERSION}/installers/glnxa64/MCR_${MATLAB_VERSION}_glnxa64_installer.zip && \
    unzip -q /opt/mcr_install/MCR_${MATLAB_VERSION}_glnxa64_installer.zip -d /opt/mcr_install && \
    /opt/mcr_install/install -destinationFolder /opt/mcr -agreeToLicense yes -mode silent && \
    rm -rf /opt/mcr_install

    MCR_VERSION=v93
    LD_LIBRARY_PATH=/opt/mcr/${MCR_VERSION}/runtime/glnxa64:/opt/mcr/${MCR_VERSION}/bin/glnxa64:/opt/mcr/${MCR_VERSION}/sys/os/glnxa64:/opt/mcr/${MCR_VERSION}/sys/opengl/lib/glnxa64
    MCR_INHIBIT_CTF_LOCK=1
    export MATLAB_VERSION MCR_VERSION LD_LIBRARY_PATH MCR_INHIBIT_CTF_LOCK

    #############################
    # SPM
    #############################

    SPM_VERSION=12
    SPM_REVISION=r7244
    SPM_DIR=/opt/spm${SPM_VERSION}
    SPM_EXEC=${SPM_DIR}/spm${SPM_VERSION}
    export SPM_DIR SPM_EXEC SPM_VERSION SPM_REVISION
    
    wget -P /opt http://www.fil.ion.ucl.ac.uk/spm/download/restricted/bids/spm${SPM_VERSION}_${SPM_REVISION}_Linux_${MATLAB_VERSION}.zip && \
    unzip -q /opt/spm${SPM_VERSION}_${SPM_REVISION}_Linux_${MATLAB_VERSION}.zip -d /opt && \
    rm -f /opt/spm${SPM_VERSION}_${SPM_REVISION}_Linux_${MATLAB_VERSION}.zip && \
    ${SPM_EXEC} function exit
    chmod 0755 ${SPM_EXEC}


#cleanup
cd
rm -rf ${ANTS_GIT_REPOSITORY}
apt-get purge $BUILD_SOFTWARE -y
apt-get autoclean -y
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*


%test

# Is antsRegistration in its place and executable?
export ANTS_HOME=/opt/ants/bin/
if [ -d "$ANTS_HOME" ]; then
   /opt/ants/bin/antsRegistration -h
fi
