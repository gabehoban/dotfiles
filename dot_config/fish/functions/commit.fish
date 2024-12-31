# Write conventional commits with steeze
# commit $type[!]?[-$scope]?[!]? $message // $long message
# Examples:
#   `commit chore update readme`                                          => `chore: update readme`
#   `commit feat-renovate add new package rule`                           => `feat(renovate): add new package rule`
#   `commit feat!-kubernetes remove rook-ceph`                            => `feat(kubernetes)!: remove rook-ceph`
#   `commit feat-kubernetes! remove rook-ceph`                            => `feat(kubernetes)!: remove rook-ceph`
#   `commit feat-kubernetes! remove rook-ceph // I want to use Longhorn`  => `feat(kubernetes)!: remove rook-ceph` with `I want to use Longhorn` ammended
# revert, chore, ci, docs, refactor, perf, test, build, feat, fix, style
function commit --description 'git conventional commits'
    if test (count $argv) -gt 0
        set title $argv[1]
        set description $argv[2..-1]
        if not string length -q $description
            printf "Whoops you are missing a commit message" | cowsay | lolcat
            return
        end
        set short (string trim (string split "//" "$description" -f1))
        set long (string trim (string split "//" "$description" -m1 -f2))
        if string match -q '*-*' $title
            set type (string trim (string split "-" "$title" -f1))
            set scope (string trim (string split "-" "$title" -m1 -f2))
            set title "$type($scope)"
            if string match -q '*!' "$scope"
                set scope (string trim --chars="!" $scope)
                set title "$type($scope)!"
            end
        end
        if not string length -q $long
            git commit -s -m "$title: $short"
        else
            git commit -s -m "$title: $short" -m "$long"
        end
    else
        set title (curl -sL https://whatthecommit.com/index.txt)
        set short (curl -sL https://whatthecommit.com/index.txt)
        set long "Commit generated by whatthecommit.com"
        git commit -s -m "$title: $short" -m "Commit generated by whatthecommit.com"
    end
    printf "%s: %s\n\n%s" $title $short $long | cowsay | lolcat
end