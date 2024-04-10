#!/bin/sh

LC_ALL=POSIX
LC_NUMERIC=POSIX
export LC_ALL LC_NUMERIC

# correct answers
MONO_BEFORE=40d859e7c05a93883eff84077edaef52
STEREO_BEFORE=3f5fb4e39d2ad8c6b1cf7bf7e6eed20b
LVL_MONO="-6.0211dBFS  -3.0106dBFS  -5.9789dB  mono16.wav"
LVL_STEREO="-6.0211dBFS  -3.0106dBFS  -5.9789dB  stereo16.wav"
MONO_AFTER=3b41f1dc0623c53473f603a0451d59ca
STEREO_AFTER=8312e5c583e5cb60dda29d0289895cb2

exec 3>> test16.log
echo "Testing 16-bit wavs..." >&3

../src/mktestwav -a 0.5 -b 2 -c 1 mono16.wav
../src/mktestwav -a 0.5 -b 2 -c 2 stereo16.wav

# Check that the files written by mktestwav are correct
CHKSUM=`tail -c +44 mono16.wav | md5sum`
case "$CHKSUM" in
    $MONO_BEFORE*) ;;
    *) echo "FAIL: created mono16.wav has bad checksum!" >&3; exit 1 ;;
esac
CHKSUM=`tail -c +44 stereo16.wav | md5sum`
case "$CHKSUM" in
    $STEREO_BEFORE*) ;;
    *) echo "FAIL: created stereo16.wav has bad checksum!" >&3; exit 1 ;;
esac

echo "mono16.wav and stereo16.wav created..." >&3

# Check that normalize correctly measures the volume of the files
NORM=`../src/normalize -qn mono16.wav`
if test x"$NORM" != x"$LVL_MONO"; then
    echo "FAIL: measured volume of mono16.wav is incorrect:" >&3
    echo "    should be: $LVL_MONO" >&3
    echo "    got:       $NORM" >&3
    exit 1
fi
NORM=`../src/normalize -qn stereo16.wav`
if test x"$NORM" != x"$LVL_STEREO"; then
    echo "FAIL: measured volume of stereo16.wav is incorrect:" >&3
    echo "    should be: $LVL_STEREO" >&3
    echo "    got:       $NORM" >&3
    exit 1
fi

echo "mono16.wav and stereo16.wav measured successfully..." >&3

# Check that normalize correctly normalizes the volume of the files
../src/normalize -q mono16.wav
../src/normalize -q stereo16.wav
CHKSUM=`tail -c +44 mono16.wav | md5sum`
case "$CHKSUM" in
    $MONO_AFTER*) ;;
    *) echo "FAIL: adjusted mono16.wav has bad checksum!" >&3; exit 1 ;;
esac
CHKSUM=`tail -c +44 stereo16.wav | md5sum`
case "$CHKSUM" in
    $STEREO_AFTER*) ;;
    *) echo "FAIL: adjusted stereo16.wav has bad checksum!" >&3; exit 1 ;;
esac

echo "mono16.wav and stereo16.wav adjusted successfully..." >&3
echo "PASSED!" >&3

exit 0
