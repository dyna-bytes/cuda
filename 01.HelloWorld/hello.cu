#include <stdio.h>
#include <cuda.h>

__global__ void cuda_hello(){
	printf("Hello World from GPU!\n");
}

int main() {
	printf("Hello World!\n");
	cuda_hello<<<1,1>>>();

	cudaError_t cudaerr = cudaDeviceSynchronize();
	if (cudaerr != cudaSuccess)
		printf("kernel launch failed with error \"%s\".\n",
				cudaGetErrorString(cudaerr));
	return 0;
}
