from setuptools import setup, find_packages

setup(
    name='python',
    version='0.1',
    packages=find_packages(),
    install_requires=[
        # Add your dependencies here
        'dependency1',
        'dependency2',
    ],
    entry_points={
        'console_scripts': [
            'python=your_package.module:function',
        ],
    },
)
