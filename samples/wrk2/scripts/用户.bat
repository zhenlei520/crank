@echo off
set /p envContent=<.\env
set /p env=<%envContent%

cd ../

echo ��ǰ�̷���"%~d0"
echo ��ǰ�̷���·����"%~dp0"
echo ��ǰ������ȫ·����"%~f0"
echo ��ǰ�̷���·���Ķ��ļ�����ʽ��"%~sdp0"
echo ��ǰCMDĬ��Ŀ¼��"%cd%"

start %cd%\benchmarks\api\add\guide.bat "--profile crankAgent1 %env% --description "�û�ҳ��-��ȡ�û�����""
start %cd%\benchmarks\api\add\guide.bat "--profile crankAgent2 %env% --description "�û�ҳ��-����û�""
pause