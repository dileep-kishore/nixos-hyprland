repo_link=$1

# clone
gh repo clone "$repo_link" .bare -- --bare
echo "gitdir: ./.bare" >.git

# fetch
git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
git fetch
git for-each-ref --format='%(refname:short)' refs/heads | xargs -n1 -I{} git branch --set-upstream-to=origin/{} {}
