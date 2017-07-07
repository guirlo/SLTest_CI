import matlab.unittest.TestRunner
import matlab.unittest.plugins.TAPPlugin
import matlab.unittest.plugins.ToFile
jenkins_workspace = getenv('WORKSPACE');
try
    % Create testsuite from all test files in Jenkins workspace 
    % picked up from the SCM repository
    suite = testsuite();
    
    tapResultsFile = fullfile(jenkins_workspace, 'TAPResults.tap');
    
    % Create and configure the runner
    runner = TestRunner.withTextOutput();
    runner.addPlugin(TAPPlugin.producingVersion13(ToFile(tapResultsFile)));
		
	% Run tests
    results = runner.run(suite);
    display(results);
catch e
    disp(getReport(e, 'extended'));
end
