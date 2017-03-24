//
//  Config.m

// API REQUEST
#define SERVER_URL @"http://172.16.1.210:8080/soun"
#define API_KEY @"bb79af414c5c877a86d1e0ccacdc56ffc1e45bf8"

#define API_URL_USER_LOGIN (SERVER_URL @"/api/user_login")


// MEDIA CONFIG


// Utility Values
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r / 255.0f) green:(g / 255.0f) blue:(b / 255.0f) alpha:a]
#define M_PI 3.14159265358979323846264338327950288

// Default Config
#define TABLEVIEW_SCROLL_MARGIN_HEIGHT 60.0f
#define REPORT_MAX_LENGTH 255