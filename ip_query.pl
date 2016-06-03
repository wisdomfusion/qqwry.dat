#!/usr/bin/perl -w
use strict;
use v5.12;

use utf8;
use Encode;
use IP::QQWry::Decoded;
use Carp qw( croak );

binmode(STDIN,  ':encoding(utf8)');
binmode(STDOUT, ':encoding(utf8)');
binmode(STDERR, ':encoding(utf8)');

my $qqwry = IP::QQWry::Decoded->new('qqwry.dat', 'gbk');

open my $out_fh, '>>', 'ipinfo.txt'
    or croak "Can't open file: $!";

while (<DATA>) {
    my $ip   = chomp($_);
    my $no   = $.;
    my $info = $qqwry->query($ip);
    my $pro  = qw{ };
    
    if ( $info =~ /^(.*?省|宁夏|广西|新疆|内蒙古|.*?市)/ ) {
        $pro = $1;
    }
    
    print           "$no\t$ip\t$info\t$pro\n";
    print {$out_fh} "$no\t$ip\t$info\t$pro\n";
    $out_fh->autoflush(1);
}

__DATA__
58.241.163.163
218.4.127.202
49.67.233.148
124.116.225.38
123.126.22.198
182.114.86.20
61.133.220.114
223.146.125.163
180.111.11.41
60.222.139.76
110.187.218.8
180.111.11.41
112.94.67.249
110.88.226.96
117.88.81.6
218.240.149.50
124.73.134.115
