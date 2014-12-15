#! /bin/bash

BUILD_FILE=$MY_BUILD_FILE
BUILD_DIR=/home/myapp
echo "My build file = " $BUILD_FILE
sudo mkdir $BUILD_DIR
sudo chmod 755 $BUILD_DIR
cd $BUILD_DIR
sudo cp /tmp/$BUILD_FILE $BUILD_DIR
sudo tar -xzvf $BUILD_FILE
sudo touch $BUILD_DIR/log/production.log
sudo chmod 666 $BUILD_DIR/log/production.log
sudo touch $BUILD_DIR/log/development.log
sudo chmod 666 $BUILD_DIR/log/development.log
echo "Installing bundled gems"
bundler install
echo "Build complete and ready at " $BUILD_DIR/$BUILD_FILE
echo ls $BUILD_DIR
