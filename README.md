# read_edf_signal
read large edf , extract one signal's data, not all signals

## install

use [edfize](https://github.com/sleepepi/edfize)

``gem install edfize``

## usage

    ruby read_edf_signal.rb [edf file] [signal name] 

    ruby read_edf_signal.rb test.edf  SpO2 >  test-SpO2.txt

## note

### edfize 库

关键函数在 https://github.com/sleepepi/edfize/blob/master/lib/edfize/edf.rb

print_header 函数可以查看一些基本信息

load_digital_signals_by_epoch 函数可以指定标号读出少量信息（不用一次读入整个大文件）

里面读binary数据主要就是这一行： 

    all_signal_data = (IO.binread(@filename, length_of_bytes_to_read, size_of_header + epoch_offset_size).unpack('s<*') rescue [])

### 相关软件

edf文件格式说明：[The EDF format](http://www.teuniz.net/edfbrowser/edf%20format%20description.html)

这个好像是医学上用来记录健康指标数据的

把edf文件成ascii：[edf2ascii](http://www.teuniz.net/edf2ascii/)，不过是整文件转，速度有点慢

直接查看指标曲线：[edfbrowser](http://www.teuniz.net/edfbrowser/index.html)，打开大文件的速度挺快

