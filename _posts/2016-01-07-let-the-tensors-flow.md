---
title: Let The Tensors Flow (A Tutorial)
layout: post
tag: tensorflow
local: 2016-01-07-let-the-tensors-flow
---

I wanted to implement a neural network myself and see how it would work in finding Wally. Since Google released TensorFlow recently, and it seemed like a really good toolbox, I set out to install and use it.

It's worth mentioning that TensorFlow is moving extremely quickly, so stuff on <a href="https://www.tensorflow.org/">TensorFlow</a> is actually very out dated. The GitHub source is the most updated. The wheels from pip install are very different from the one on GitHub. I raised an <a href="https://github.com/tensorflow/tensorflow/issues/691">issue on GitHub</a> and offered to fix it, but the main contributors said that they will release new wheels when there's a new version. So for those who are confused as to how to get it to work, here's a tutorial for you!

Only tried and tested on Ubuntu 14.04. Correct as of 7th January 2016.

<h3>Step 1: Install Java</h3>
{% highlight python%}
$ sudo add-apt-repository ppa:webupd8team/java
$ sudo apt-get update
$ sudo apt-get install oracle-java8-installer
{% endhighlight %}

<h3>Step 2: Install Bazel</h3>
Download bazel from <a href="https://github.com/bazelbuild/bazel/releases/download/0.1.2/bazel-0.1.2-installer-linux-x86_64.sh">here</a>. Then go into the directory you've downloaded it and execute the code below. Of course, .sh file depends on which version you downloaded.

{% highlight python%}
chmod +x bazel-0.1.2-installer-linux-x86_64.sh
./bazel-0.1.2-installer-linux-x86_64.sh --user
{% endhighlight %}

If you encounter a problem like set JAVA_HOME. Go to /etc/environment and add the following:

JAVA_HOME=/usr/lib/jvm/java-8-oracle

Following that, place Bazel in your path.

<h3>Step 3: Install Some Python Modules</h3>
{% highlight python%}
$ sudo apt-get install python-numpy swig python-dev
{% endhighlight %}

<h3>Step 4: Install TensorFlow</h3>
Clone TensorFlow into Directory.
{% highlight python%}
$ git clone --recurse-submodules https://github.com/tensorflow/tensorflow
$ ./configure
{% endhighlight %}
Default is /usr/bin/python. Most of us would just put the default.

At this step, you would have thought that everything is nice and complete. After all, the next step is "Optional". However, when we try and run perhaps /tensorflow/tensorflow/examples/tutorials/mnist/fully_connected_feed.py, we get an error message that says: "No module named tensorflow.python.platform"

This happens because tensorflow has not been "pip installed". Therefore, we have to build the wheel and then install it. Bazel now comes in handy. Note that you have to be in the tensorflow directory (the first one).

{% highlight python %}
WITHOUT GPU SUPPORT
$ bazel build -c opt //tensorflow/tools/pip_package:build_pip_package
$ bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
$ pip install /tmp/tensorflow_pkg/tensorflow-0.5.0-cp27-none-linux_x86_64.whl
{% endhighlight %}

After this, it should be all done! But if you do encounter a problem, upgrading may fix it.

{% highlight python %}
$ sudo install --upgrade tensorflow-0.5.0-cp27-none-linux_x86_64.whl
{% endhighlight %}

This should get TensorFlow up and running. Pardon the potentially ugly highlighted black boxes, I couldn't get it to be simple black and white. It's a CSS fix in future, but please bear with it for now :)

