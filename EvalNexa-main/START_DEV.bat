@echo off
echo ============================================
echo   EvalNexa - Starting Dev Environment
echo ============================================
cd /d "C:\Users\DELL\Downloads\nit-main\EvalNexa-main"

echo.
echo [1/2] Installing dependencies (pnpm install)...
call pnpm install
if %errorlevel% neq 0 (
    echo ERROR: pnpm install failed. Make sure pnpm is installed globally.
    echo Run: npm install -g pnpm
    pause
    exit /b 1
)

echo.
echo [2/2] Starting all dev servers...
echo   Control Center  -> http://localhost:5173
echo   Teacher Desk    -> http://localhost:5174
echo   Grade Review    -> http://localhost:5175
echo   Backend API     -> http://localhost:5000
echo.
echo NOTE: MongoDB must be running locally (mongod)
echo       OR update backend\.env with your MongoDB Atlas URI
echo.
start "Backend API (port 5000)" cmd /k "cd /d C:\Users\DELL\Downloads\nit-main\EvalNexa-main && pnpm dev:backend"
timeout /t 4 /nobreak >nul
start "Control Center (port 5173)" cmd /k "cd /d C:\Users\DELL\Downloads\nit-main\EvalNexa-main && pnpm dev:control-center"
start "Teacher Desk (port 5174)" cmd /k "cd /d C:\Users\DELL\Downloads\nit-main\EvalNexa-main && pnpm dev:examiner"
start "Grade Review (port 5175)" cmd /k "cd /d C:\Users\DELL\Downloads\nit-main\EvalNexa-main && pnpm dev:moderation"

echo.
echo All servers started. Check the opened terminal windows.
echo.
echo URLs:
echo   http://localhost:5173   - Assignment & Coursework Control (Admin)
echo   http://localhost:5174   - Teacher Grading Desk (Examiner)
echo   http://localhost:5175   - Grade Quality & Review Center (Moderator)
echo.
pause
