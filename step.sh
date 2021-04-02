#!/bin/bash

set -e

printf "\n ************** Copying firebase files ****************"

if [ -z "${platform}" ] ; then
	finalcleanup "Input: \`platform\` not provided!"
	exit 1
fi

if [ -z "${principal_branch}" ] ; then
	finalcleanup "Input: \`principal branch\` not provided!"
	exit 1
fi

if [ "${platform}" == "both" ]; then


    if [ -z "${google_services_file_android_prod}" ] ; then
        finalcleanup "Input: \`Google services file android prod\` not provided!"
        exit 1
    fi
    
    if [ -z "${google_services_file_ios_prod}" ] ; then
        finalcleanup "Input: \`Google services file ios prod\` not provided!"
        exit 1
    fi

    if [ -z "${google_services_file_android_dev}" ] ; then
        finalcleanup "Input: \`Google services file android dev\` not provided!"
        exit 1
    fi

    if [ -z "${google_services_file_ios_dev}" ] ; then
        finalcleanup "Input: \`Google services file ios dev\` not provided!"
        exit 1
    fi

    if [  "$BITRISE_GIT_BRANCH" == "${principal_branch}" ]; then
    printf "\n Switching to Firebase Production environment \n"
    cp -rf "${google_services_file_android_prod}" "${workdir_android}${android_folder}"
    printf "\n Android config file copied \n"
    cp -rf "${google_services_file_ios_prod}" "${workdir_ios}${ios_scheme_name}"
    printf "\n IOS config file copied"
    else
    printf "\n Switching to Firebase Dev environment \n"
    cp -rf "${google_services_file_android_dev}" "${workdir_android}${android_folder}"
    printf "\n Android config file copied \n"
    cp -rf "${google_services_file_ios_dev}" "${workdir_ios}${ios_scheme_name}"
    printf "\n IOS config file copied"
    fi
fi

if [ "${platform}" == "iOS" ]; then

    if [ -z "${google_services_file_ios_prod}" ] ; then
        finalcleanup "Input: \`Google services file ios prod\` not provided!"
        exit 1
    fi

    if [ -z "${google_services_file_ios_dev}" ] ; then
        finalcleanup "Input: \`Google services file ios dev\` not provided!"
        exit 1
    fi

    if [  "$BITRISE_GIT_BRANCH" == "${principal_branch}" ]; then
    printf "\n Switching to Firebase Production environment \n"
    cp -rf "${google_services_file_ios_prod}" "${workdir_ios}${ios_scheme_name}"
    printf "\n IOS config file copied"
    else
    printf "\n Switching to Firebase Dev environment \n"
    cp -rf "${google_services_file_ios_dev}" "${workdir_ios}${ios_scheme_name}"
    printf "\n IOS config file copied"
    fi
fi

if [ "${platform}" == "Android" ]; then

    if [ -z "${google_services_file_android_prod}" ] ; then
        finalcleanup "Input: \`Google services file android prod\` not provided!"
        exit 1
    fi

    if [ -z "${google_services_file_android_dev}" ] ; then
        finalcleanup "Input: \`Google services file android dev\` not provided!"
        exit 1
    fi

    if [  "$BITRISE_GIT_BRANCH" == "${principal_branch}" ]; then
    printf "\n Switching to Firebase Production environment \n"
    cp -rf "${google_services_file_android_prod}" "${workdir_android}${android_folder}"
    printf "\n Android config file copied"
    else
    printf "\n Switching to Firebase Dev environment \n"
    cp -rf "${google_services_file_android_dev}" "${workdir_android}${android_folder}"
    printf "\n Android config file copied"
    fi
fi

printf "\n ******************************"

