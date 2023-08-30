$programs = @(
"Microsoft News",
"MSN Weather",
"Xbox",
"Get Help",
"Microsoft Tips",
"Microsoft Solitaire Collection",
"OneDrive",
"Microsoft People",
"Microsoft To Do",
"Feedback Hub",
"Windows Maps",
"Xbox TCUI ",
"Xbox Game Bar Plugin",
"Xbox Game Bar ",
"Xbox Identity Provider",
"Xbox Game Speech Window",
"Your Phone",
"Microsoft Teams",
"Microsoft OneDrive",
"Mail and Calendar"
)

foreach ($i in $programs) {
    $command = `winget uninstall "$i"`
    
    $command
}