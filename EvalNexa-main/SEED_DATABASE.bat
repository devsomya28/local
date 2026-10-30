@echo off
echo ============================================
echo   EvalNexa - Seed Database with Demo Data
echo ============================================
echo.
echo This will create demo users, assignments, submissions etc.
echo.
cd /d "C:\Users\DELL\Downloads\nit-main\EvalNexa-main"
call pnpm seed
echo.
echo ============================================
echo Default Login Credentials:
echo   Admin:    admin@evalnexa.dev / Admin@123456
echo   Examiner: examiner@evalnexa.dev / Admin@123456
echo   Moderator: moderator@evalnexa.dev / Admin@123456
echo ============================================
pause
