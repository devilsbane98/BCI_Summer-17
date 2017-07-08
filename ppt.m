h = actxserver('PowerPoint.Application');
h.Visible = 1; % make the window show up
h.Presentations.Open('C:\Users\Asus\Dropbox\BCI Summer 17\do not touch\motor.pptx');
%%
h.ActivePresentation.SlideShowSettings.Run;  % there is now a slide show running
%%
hShow = h.SlideShowWindows.Item(1);
