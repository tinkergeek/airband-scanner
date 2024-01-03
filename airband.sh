#!/bin/bash

docker run -d \
	--rm \
	--name airband \
	-p 8080:8000 \
	--device /dev/bus/usb:/dev/bus/usb \
	-e ICECAST_CUSTOMCONFIG=1 \
	-e RTLSDRAIRBAND_CUSTOMCONFIG=1 \
	-e NFM_MAKE=1 \
	-v /root/rtl:/run/rtlsdr-airband \
	-v /storage/mp3:/storage \
	ghcr.io/sdr-enthusiasts/docker-rtlsdrairband:latest_nohealthcheck

