#!/bin/sh

LC_ALL=POSIX
LC_NUMERIC=POSIX
export LC_ALL LC_NUMERIC

# correct answers
MONO_BEFORE=1f6586aa8a849a3bd8b24b42eb9e3f63
STEREO_BEFORE=24d9a4de01f11c0a4e37c1f0fedb1675
LVL_MONO="-6.0206dBFS  -3.0104dBFS  -5.9794dB  mono24.wav"
LVL_STEREO="-6.0206dBFS  -3.0104dBFS  -5.9794dB  stereo24.wav"
MONO_AFTER=1553f2c735477f1de783365db1bec012
STEREO_AFTER=cf7581a8924eb3b29b93e93bc6a9f7dc

exec 3>> test24.log
echo "Testing 24-bit wavs..." >&3

../src/mktestwav -a 0.5 -b 3 -c 1 mono24.wav
../src/mktestwav -a 0.5 -b 3 -c 2 stereo24.wav

# Check that the files written by mktestwav are correct
CHKSUM=`tail -c +44 mono24.wav | md5sum`
case "$CHKSUM" in
    $MONO_BEFORE*) ;;
    *) echo "FAIL: created mono24.wav has bad checksum!" >&3; exit 1 ;;
esac
CHKSUM=`tail -c +44 stereo24.wav | md5sum`
case "$CHKSUM" in
    $STEREO_BEFORE*) ;;
    *) echo "FAIL: created stereo24.wav has bad checksum!" >&3; exit 1 ;;
esac

echo "mono24.wav and stereo24.wav created..." >&3

# Check that normalize correctly measures the volume of the files
NORM=`../src/normalize -qn mono24.wav`
if test x"$NORM" != x"$LVL_MONO"; then
    echo "FAIL: measured volume of mono24.wav is incorrect:" >&3
    echo "    should be: $LVL_MONO" >&3
    echo "    got:       $NORM" >&3
    exit 1
fi
NORM=`../src/normalize -qn stereo24.wav`
if test x"$NORM" != x"$LVL_STEREO"; then
    echo "FAIL: measured volume of stereo24.wav is incorrect:" >&3
    echo "    should be: $LVL_STEREO" >&3
    echo "    got:       $NORM" >&3
    exit 1
fi

echo "mono24.wav and stereo24.wav measured successfully..." >&3

# Check that normalize correctly normalizes the volume of the files
../src/normalize -q mono24.wav
../src/normalize -q stereo24.wav
CHKSUM=`tail -c +44 mono24.wav | md5sum`
case "$CHKSUM" in
    $MONO_AFTER*) ;;
    *) echo "FAIL: adjusted mono24.wav has bad checksum!" >&3; exit 1 ;;
esac
CHKSUM=`tail -c +44 stereo24.wav | md5sum`
case "$CHKSUM" in
    $STEREO_AFTER*) ;;
    *) echo "FAIL: adjusted stereo24.wav has bad checksum!" >&3; exit 1 ;;
esac

echo "mono24.wav and stereo24.wav adjusted successfully..." >&3
echo "PASSED!" >&3

exit 0
