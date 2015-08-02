property git_status : "git status" --returns current git status
property git_add : "git add" --add a file or many files to a commit
property git_reset : "git add" --the opposite of the add action
property git_log : "git log" --git log
property git_push : "git push" --this uploads the current from the local git commits to the remote git
property git_pull : "git pull" --this downloads the current from the remote git to the local git
property git_pretty_log : "git log --pretty=oneline" --get a log of what is new, less verbose with pretty oneline
property git_commit : "git commit" --commit current changes
property git_path : "/usr/local/git/bin/" --to execute git commands we need to call the git commands from this path
(* 
 * Todo: Should return a more meaningfull list of items, multidim accociative array
 * @param local_repo_path is the path to the target repository on your local machine
 * @Note: the cd is to move manouver into the local repository path, the ; char ends the call so you can make another call
 *)
on status(local_repo_path, option)
	return do shell script "cd " & local_repo_path & ";" & git_path & git_status & " " & option
end status
(* 
 * @param file_name is the file name you want to add, use * if you want to add all files
 * @example: GitUtils's add(local_repo_path, "*")
 *)
on add(local_repo_path, file_name)
	return do shell script "cd " & local_repo_path & ";" & git_path & git_add & " " & file_name
end add

(* 
 * commit 
 * @param msg example: "created index.html file"
 * @return example: [master af86d55] added
 * 1 file changed, 0 insertions(+), 0 deletions(-)
 * create mode 100644 error.html
 * @Note: its important that the message is betweentwo single quates
 * @example: GitUtils's commit(local_repo_path, "changes made")
 * Todo: can we also add desscription to a commit?
 * @Note: There is no "extended description" concept in git. Only the commit message. What happens is that the commit message can have a single line or multiple lines External tools or websites such as git-cola or GitHub can interpret multiple lines commit messages as: The first line is a short description All the other lines are an extended description For one line messages, only the "short description" is defined.
 * // :TODO: git commit -m "Title" -m "Description .........."
 *)
on commit(local_repo_path, the_msg)
	log "the_msg: " & the_msg
	return do shell script "cd " & local_repo_path & ";" & git_path & git_commit & " " & "-m" & " '" & the_msg & "'"
end commit
--push
--this uploads the current from the local git commits to the remote git
(*
 * @param from_where: "master"
 * @param to_where: "origin"
 * @param remote_repo_url: github.com/user-name/repo-name.git
 * @Note: you may mitigate using username and pass by researching how to use SSH key in github from trusted maschines
<<<<<<< HEAD
 * Todo: maybe add try error when doing the shell part
=======
 * @example: GitUtils's push(local_repo_path, "github.com/user-name/repo-name.git", user_name, user_password)
>>>>>>> origin/master
 *)
on push(local_repo_path, remote_repo_url, user_name, user_password)
	set from_where to "master" --master branch
	set to_where to "https://" & user_name & ":" & user_password & "@" & remote_repo_url --https://user:pass@github.com/user/repo.git--"origin"
	return do shell script "cd " & local_repo_path & ";" & git_path & git_push & " " & to_where & " " & from_where
end push
--the opposite of the add action
--The * resets all
on reset(local_repo_path, file_name)
	return do shell script "cd " & local_repo_path & ";" & git_path & git_reset & " " & file_name
end reset
(*
 * Note: the original git cmd is "git pull origin master"
 * Note: "https://user:pass@github.com/user/repo.git"
 * Note: returns "Already up-to-date." if there are nothing to pull from remote
 * Todo: Do we need login and pass for pulling?
 *)
on pull(local_repo_path, remote_repo_url, user_name, user_password)
	set from_where to "https://" & user_name & ":" & user_password & "@" & remote_repo_url
	set to_where to "master" --master branch
	return do shell script "cd " & local_repo_path & ";" & git_path & git_pull & " " & from_where & " " & to_where
end pull
--log

--config


--rm --remove files, research this

--init

--clone

--remote add origin

--try to clone a remote REPO 


--try to pull a repo


--get a log of what is new, less verbose with pretty oneline
--git log --pretty=oneline

--set your name and email
--git config --global user.email you@example.com
--git config --globaluser.name "eonist"

