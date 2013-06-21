Example results

Top 5 questions/issues in Support for #{month}:

Feature Requests #{Jira.get_request_count(month)}
Bug reports: #{Jira.get_bug_count(month)}

"Top 5 New Bugs"
bugs = Jira.fetch_bugs()
bugs.each do |bug|
    $bug.id $bug.title
end

"Top 5 Product Requests"
requests = feedback.get_requests()
requests.each do |request|
    request.info
end



