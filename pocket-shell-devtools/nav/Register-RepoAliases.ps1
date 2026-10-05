# Register EVERY RepoMap alias:  <alias> [gplm|gpl|gph|...]
foreach ($aliasKey in @($script:RepoMap.Keys)) {
  $repoFolder = $script:RepoMap[$aliasKey]
  Set-Item -Path "Function:Global:$aliasKey" -Value ([scriptblock]::Create(@"
    param([Parameter(ValueFromRemainingArguments = `$true)][string[]]`$Rest)
    Invoke-PsRepoGit -RepoFolder '$repoFolder' @Rest
"@))
}
