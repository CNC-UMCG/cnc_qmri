Bootstrap: shub
From: CNC-UMCG/cnc_base



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

